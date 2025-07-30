// deep combination of optionals, messages, defaults
message(0xBEEF) MsgD {
 x: Int = 1;
 y: String? = null;
}

struct ContainsMsgOpt {
 m: MsgD? = null;
}

contract DeepComb {
 data: ContainsMsgOpt? = null;

 init() {
   self.data = null;
 }
}