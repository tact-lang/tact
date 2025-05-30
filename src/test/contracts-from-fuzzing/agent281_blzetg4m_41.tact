// Now try to use nested 'as remaining' overlays: allowed?
struct C {
   payload: Cell as remaining;
}

struct B {
   inner: C;
   tail: Slice as remaining;
}

contract NestedRemainingOverlay {
   data: B;

   init() {
     self.data = B { inner: C { payload: emptyCell() }, tail: emptyCell().asSlice() };
   }
}