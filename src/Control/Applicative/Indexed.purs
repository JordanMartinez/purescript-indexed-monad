module Control.Applicative.Indexed
  ( class IxApplicative
  , ipure
  , iwhen
  , iunless
  , module Control.Apply.Indexed
  ) where

import Prelude (Unit, unit)
import Control.Apply.Indexed
import Control.ValidTransition (class ValidTransition)

class IxApply m ⇐ IxApplicative m where
  ipure ∷ ∀ a x y. ValidTransition x y ⇒ a → m x y a

iwhen ∷ ∀ m x y. ValidTransition x y ⇒ IxApplicative m ⇒ Boolean → m x y Unit → m x y Unit
iwhen true m = m
iwhen false _ = ipure unit

iunless ∷ ∀ m x y. ValidTransition x y ⇒ IxApplicative m ⇒ Boolean → m x y Unit → m x y Unit
iunless false m = m
iunless true _ = ipure unit
