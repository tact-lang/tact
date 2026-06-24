trait TraitWithFields { x: Int }
trait Trait2 { y: Int }

contract MultiInherit with TraitWithFields, Trait2 {
 x: Int;
 y: Int;
 init() { self.x = 1; self.y = 2; }
}