struct NestedDefaults {
  a: Int = 1;
  b: Bool = false;
  c: Address;
}

contract StructWithInit {
    param: NestedDefaults;

    init() {
        self.param = NestedDefaults{ c: myAddress() };
    }
}