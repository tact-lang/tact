struct VeryDeep1 { next: Int; }
struct VeryDeep2 { next: VeryDeep1; }
struct VeryDeep3 { next: VeryDeep2; }
struct VeryDeep4 { next: VeryDeep3; }
struct VeryDeep5 { next: VeryDeep4; }
struct VeryDeep6 { next: VeryDeep5; }
struct VeryDeep7 { next: VeryDeep6; }
struct VeryDeep8 { next: VeryDeep7; }
struct VeryDeep9 { next: VeryDeep8; }

contract Deepest {
    root: VeryDeep9;

    init() {
        self.root = VeryDeep9 {
            next: VeryDeep8 {
                next: VeryDeep7 {
                    next: VeryDeep6 {
                        next: VeryDeep5 {
                            next: VeryDeep4 {
                                next: VeryDeep3 {
                                    next: VeryDeep2 {
                                        next: VeryDeep1 {
                                            next: 1
                                        }
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
