struct VeryDeep1 { next: VeryDeep2 }
struct VeryDeep2 { next: VeryDeep3 }
struct VeryDeep3 { next: VeryDeep4 }
struct VeryDeep4 { next: VeryDeep5 }
struct VeryDeep5 { next: VeryDeep6 }
struct VeryDeep6 { next: VeryDeep7 }
struct VeryDeep7 { next: VeryDeep8 }
struct VeryDeep8 { next: VeryDeep9 }
struct VeryDeep9 { last: Int }

contract DeepContract {
    start: VeryDeep1;

    init() {
        self.start = VeryDeep1 {
            next: VeryDeep2 {
                next: VeryDeep3 {
                    next: VeryDeep4 {
                        next: VeryDeep5 {
                            next: VeryDeep6 {
                                next: VeryDeep7 {
                                    next: VeryDeep8 {
                                        next: VeryDeep9 {
                                            last: 999
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