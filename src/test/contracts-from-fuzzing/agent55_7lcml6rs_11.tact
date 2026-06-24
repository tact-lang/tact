message HasOptional {
    a: Int?
}

contract TestContract {
    receive(msg: HasOptional) {
        if (msg.a != null) {
            let x = msg.a;
        }
    }
}