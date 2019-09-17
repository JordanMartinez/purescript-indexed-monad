module Data.IndexedNaturalTransformation where

type IndexedNaturalTransformation m n = forall x y a. m x y a -> n x y a

infixr 4 type IndexedNaturalTransformation as ~~>
