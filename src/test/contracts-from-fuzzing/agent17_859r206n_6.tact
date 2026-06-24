contract C {
    receive() {
        // Terminal contract that does nothing.
    }
}

contract B {
    child: Address;

    init(child: Address) {
        self.child = child;
    }

    receive() {
        send(SendParameters{
            to: self.child,
            value: ton("0.01"),
            mode: SendRemainingValue,
            body: emptyCell()
        });
    }
}

contract A {
    child: Address;

    init(child: Address) {
        self.child = child;
    }

    receive() {
        send(SendParameters{
            to: self.child,
            value: ton("0.01"),
            mode: SendRemainingValue,
            body: emptyCell()
        });
    }
}
