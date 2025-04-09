struct AddressHolder { address: Address; }
struct IntHolder { intVal: Int; }
struct BoolHolder { flag: Bool; }

struct Wrapper {
  intHolder: IntHolder;
  boolHolder: BoolHolder;
  addressHolder: AddressHolder;
}

contract VariousNested {
  val: Wrapper;

  init() {
    self.val = Wrapper{
      intHolder: IntHolder{intVal: 1},
      boolHolder: BoolHolder{flag: false},
      addressHolder: AddressHolder{address: myAddress()}
    };
  }
}