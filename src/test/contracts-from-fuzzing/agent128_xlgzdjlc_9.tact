struct Nest1 {
    n2: Nest2;
    val1: Int;
}

struct Nest2 {
    n3: Nest3;
    val2: Int;
}

struct Nest3 {
    n4: Nest4;
    val3: Int;
}

struct Nest4 {
    flag: Bool;
    optVal: Int?;
}

contract TestContract {
    deep: Nest1;

    init() {
        self.deep = Nest1{
            n2: Nest2{
                n3: Nest3{
                    n4: Nest4{
                        flag: true,
                        optVal: null
                    },
                    val3: 3
                },
                val2: 2
            },
            val1: 1
        };
    }
}