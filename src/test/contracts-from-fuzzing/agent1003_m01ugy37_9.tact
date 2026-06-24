struct Tiny {
    a: Int; 
}

struct Small {
    a: Tiny; 
}

struct Mid {
    a: Small; 
}

struct Large {
    a: Mid; 
}

struct Huge {
    a: Large; 
}

contract DeepNesting {
    data: Huge;

    init() {
        self.data = Huge{
            a: Large{
                a: Mid{
                    a: Small{
                        a: Tiny { a: 1 }
                    }
                }
            }
        };
    }
}