struct VeryDeep {
    level: Int;
}

struct DeepWrap1 { x: VeryDeep; }
struct DeepWrap2 { x: DeepWrap1; }
struct DeepWrap3 { x: DeepWrap2; }
struct DeepWrap4 { x: DeepWrap3; }
struct DeepWrap5 { x: DeepWrap4; }
struct DeepWrap6 { x: DeepWrap5; }
struct DeepWrap7 { x: DeepWrap6; }
struct DeepWrap8 { x: DeepWrap7; }

contract TestContract {
    data: DeepWrap8;

    init() {
        self.data = DeepWrap8 {
            x: DeepWrap7 {
                x: DeepWrap6 {
                    x: DeepWrap5 {
                        x: DeepWrap4 {
                            x: DeepWrap3 {
                                x: DeepWrap2 {
                                    x: DeepWrap1 {
                                        x: VeryDeep{ level: 777 }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }

    receive() {
        dump(self.data.x.x.x.x.x.x.x.x.level);
    }
}