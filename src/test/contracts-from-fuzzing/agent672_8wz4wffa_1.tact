struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Cell;
    f4: Slice;
    f5: Address;
    f6: Int?;
    f7: Bool?;
    f8: Slice?;
    f9: Address?;
}

contract WideStructContract {
    data: ManyFields;

    init() {
      self.data = ManyFields{
        f1: 1, f2: true, f3: emptyCell(), f4: emptyCell().asSlice(),
        f5: myAddress(), f6: null, f7: null, f8: null, f9: null
      };
    }
}