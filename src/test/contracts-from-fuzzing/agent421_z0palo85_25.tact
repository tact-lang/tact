struct A1{ f: Int }
struct A2{ f: A1 }
struct A3{ f: A2 }
struct A4{ f: A3 }
struct A5{ f: A4 }
struct A6{ f: A5 }
struct A7{ f: A6 }
struct A8{ f: A7 }
struct A9{ f: A8 }
struct A10{ f: A9 }

contract MaxDeepNest {
    x: A10;
    init() {
        self.x = A10{
            f: A9{
                f: A8{
                    f: A7{
                        f: A6{
                            f: A5{
                                f: A4{
                                    f: A3{
                                        f: A2{
                                            f: A1{ f: 123 }
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