// struct containing message struct inside contract storage
message(77) Hello { v: Int }

struct Container { msg: Hello }

contract TestContract {
    c: Container;

    init() {
        self.c = Container{ msg: Hello{ v: 5 } };
    }
}