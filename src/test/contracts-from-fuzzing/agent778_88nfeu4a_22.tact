struct TinyStruct { x: Int as int4; y: Bool; }

contract TestTinyStruct {
    s: TinyStruct = TinyStruct{x:7,y:true};

    init() {
        self.s = TinyStruct{x:-7,y:false};
    }
}