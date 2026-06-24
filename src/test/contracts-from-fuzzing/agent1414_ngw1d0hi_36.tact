struct Nest1 { val: Int }
struct Nest2 { nest1: Nest1 }
struct Nest3 { nest2: Nest2 }
struct Nest4 { nest3: Nest3 }
struct Nest5 { nest4: Nest4 }

contract FiveLayer {
    deep: Nest5;

    init() {
        self.deep = Nest5{
            nest4: Nest4{
                nest3: Nest3{
                    nest2: Nest2{
                        nest1: Nest1{ val: 42 }
                    }
                }
            }
        };
    }
}