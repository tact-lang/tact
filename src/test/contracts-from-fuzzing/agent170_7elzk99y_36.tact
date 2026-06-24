// Test contract with nested struct containing defaulted optional message
message(0x55) MessageD {
 field: Int;
}

struct NestedWithMsgOpt {
 m: MessageD? = null;
}

contract StructMsgOpt {
 data: NestedWithMsgOpt;

 init() {
   self.data = NestedWithMsgOpt{};
 }
}