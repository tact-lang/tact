// optional message struct inside optional struct inside contract storage
message(99) Em {
   x: Int;
}

struct InS {
    m: Em?;
}

contract TestContract {
    data: InS?;

    init() {
        self.data = InS{ m: Em{ x: 7 } };
    }
}