struct Levels1 {
    val: Int;
}

struct Levels2 {
    inner: Levels1;
}

struct Levels3 {
    inner: Levels2;
}

struct Levels4 {
    inner: Levels3;
}

struct Levels5 {
    inner: Levels4;
}

contract TestContract {
    data: Levels5;

    init() {
        self.data = Levels5{
            inner: Levels4{
                inner: Levels3{
                    inner: Levels2{
                        inner: Levels1{
                            val: 123
                        }
                    }
                }
            }
        };
    }
}