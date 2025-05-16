// Contract with multiple optional nested Slices
struct Slice3 { val: Slice?; }
struct Slice2 { inner: Slice3?; }
struct Slice1 { inner: Slice2?; }

contract DeepSliceOption {
  root: Slice1;

  init() {
    self.root = Slice1{
      inner: Slice2{
        inner: Slice3{
          val: emptyCell().asSlice()
        }
      }
    };
  }
}