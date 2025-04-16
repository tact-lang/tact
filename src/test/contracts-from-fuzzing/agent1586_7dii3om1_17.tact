struct Payment {
    amount: Int;
    memo: String?;
}

struct Invoice {
    from: String;
    to: String;
    payment: Payment?;
}

contract TestContract {
    invoice: Invoice?;

    init() {
        self.invoice = Invoice{
            from: "foo",
            to: "bar",
            payment: null
        };
    }

    receive() {}
}