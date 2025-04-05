struct L10 {
    v: Int;
}

struct L9 {
    next: L10;
}

struct L8 {
    next: L9;
}

struct L7 {
    next: L8;
}

struct L6 {
    next: L7;
}

struct L5 {
    next: L6;
}

struct L4 {
    next: L5;
}

struct L3 {
    next: L4;
}

struct L2 {
    next: L3;
}

struct L1 {
    next: L2;
}

contract TestContract {
    receive() {
        // Instantiate a deep chain of 10 nested structs
        let deep = L1 {
            next: L2 {
                next: L3 {
                    next: L4 {
                        next: L5 {
                            next: L6 {
                                next: L7 {
                                    next: L8 {
                                        next: L9 {
                                            next: L10 { v: 1010 }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };

        // Access the deeply nested field's value
        let value = deep.next.next.next.next.next.next.next.next.next.v;
    }
}
