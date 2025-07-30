struct Longy {
    



























val: Int
}

contract LongStructParam {
    data: Longy;

    init() {
        self.data = Longy{
            val: 123
        };
    }

    receive() {}
}