message(0x1) MsgA { x: Int; y: Bool; }
message(0x2) MsgB { txt: String; }

struct MyStruct { foo: Int; bar: Bool; }

contract TestContract {
    ma: MsgA;
    mb: MsgB?;
    st: MyStruct;
    stOpt: MyStruct?;
    
    init() {
        self.ma = MsgA{x: 5, y: true};
        self.mb = null;
        self.st = MyStruct{foo: 1, bar: false};
        self.stOpt = MyStruct{foo: 2, bar:true};
    }
}