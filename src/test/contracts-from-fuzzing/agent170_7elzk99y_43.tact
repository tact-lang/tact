// optional message in nested optional struct field
message(11) MsgOpt {
 val: Int;
}

struct NestedOpt {
 m: MsgOpt?;
}

contract DeepOptMsg2 {
 opt: NestedOpt?;

 init() {
   self.opt = NestedOpt{ m: null };
 }
}