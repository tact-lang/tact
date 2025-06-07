struct Opt5 {
    val: Int;
}

struct Opt4 {
    next: Opt5?;
}

struct Opt3 {
    next: Opt4?;
}

struct Opt2 {
    next: Opt3?;
}

struct Opt1 {
    next: Opt2?;
}

contract Test {
    data: Opt1;

    init() {
        self.data = Opt1{
            next: Opt2{
                next: Opt3{
                    next: Opt4{
                        next: Opt5{
                            val: 123
                        }
                    }
                }
            }
        };
    }
}