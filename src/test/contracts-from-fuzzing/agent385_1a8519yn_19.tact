struct PaymentInfo {
    paid: Bool;
    amount: Int as coins;
    comment: String?;
}

contract PaymentState {
    payment: PaymentInfo;

    init() {
        self.payment = PaymentInfo{
            paid: false,
            amount: ton("5"),
            comment: null
        };
    }
}
