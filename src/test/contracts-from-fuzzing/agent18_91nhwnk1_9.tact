struct L15 { v: Int; }
struct L14 { next: L15; }
struct L13 { next: L14; }
struct L12 { next: L13; }
struct L11 { next: L12; }
struct L10 { next: L11; }
struct L9 { next: L10; }
struct L8 { next: L9; }
struct L7 { next: L8; }
struct L6 { next: L7; }
struct L5 { next: L6; }
struct L4 { next: L5; }
struct L3 { next: L4; }
struct L2 { next: L3; }
struct L1 { next: L2; }

contract TestContract {
    receive() {
        // Instantiate a deep chain of 15 nested structs
        let deep = L1 {
            next: L2 {
                next: L3 {
                    next: L4 {
                        next: L5 {
                            next: L6 {
                                next: L7 {
                                    next: L8 {
                                        next: L9 {
                                            next: L10 {
                                                next: L11 {
                                                    next: L12 {
                                                        next: L13 {
                                                            next: L14 {
                                                                next: L15 { v: 1515 }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
        // Correct number of .next chain calls: 14 times to reach L15
        let result = deep.next.next.next.next.next.next.next.next.next.next.next.next.next.next.v;
    }
}
