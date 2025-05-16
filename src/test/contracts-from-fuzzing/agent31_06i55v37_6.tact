struct L10 {
    val: Int;
}

struct L9 {
    val: Int;
    next: L10;
}

struct L8 {
    val: Int;
    next: L9;
}

struct L7 {
    val: Int;
    next: L8;
}

struct L6 {
    val: Int;
    next: L7;
}

struct L5 {
    val: Int;
    next: L6;
}

struct L4 {
    val: Int;
    next: L5;
}

struct L3 {
    val: Int;
    next: L4;
}

struct L2 {
    val: Int;
    next: L3;
}

struct L1 {
    val: Int;
    next: L2;
}

contract Test {
    receive() {
        let chain: L1 = L1 {
            val: 1,
            next: L2 {
                val: 2,
                next: L3 {
                    val: 3,
                    next: L4 {
                        val: 4,
                        next: L5 {
                            val: 5,
                            next: L6 {
                                val: 6,
                                next: L7 {
                                    val: 7,
                                    next: L8 {
                                        val: 8,
                                        next: L9 {
                                            val: 9,
                                            next: L10 {
                                                val: 10
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
        dump(chain.next.next.next.next.next.val);
    }
}
