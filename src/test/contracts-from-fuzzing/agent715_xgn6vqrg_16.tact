struct VeryDeep1 { f: VeryDeep2; }
struct VeryDeep2 { f: VeryDeep3; }
struct VeryDeep3 { f: VeryDeep4; }
struct VeryDeep4 { f: VeryDeep5; }
struct VeryDeep5 { f: VeryDeep6; }
struct VeryDeep6 { f: VeryDeep7; }
struct VeryDeep7 { f: VeryDeep8; }
struct VeryDeep8 { f: Int; }

contract TestContract {
    val: VeryDeep1;

    init() {
        self.val = VeryDeep1{
            f: VeryDeep2{
                f: VeryDeep3{
                    f: VeryDeep4{
                        f: VeryDeep5{
                            f: VeryDeep6{
                                f: VeryDeep7{
                                    f: VeryDeep8{
                                        f: 42
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}