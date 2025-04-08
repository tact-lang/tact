struct L1 { next: L2?; }
struct L2 { next: L3?; }
struct L3 { next: L4?; }
struct L4 { next: L5?; }
struct L5 { next: L6?; }
struct L6 { next: L7?; }
struct L7 { next: L8?; }
struct L8 { val: Int?; }

contract TestContract {
    root: L1;

    init() {
        self.root = L1{
            next: L2{
                next: L3{
                    next: L4{
                        next: L5{
                            next: L6{
                                next: L7{
                                    next: L8{
                                        val: null
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