message(0x111) Hello { greet: String; }

contract TestContract {
    opt_msg: Hello?;

    init() {
        self.opt_msg = null;
    }
}