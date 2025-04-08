struct PaymentData {
    fee: Int as coins;
    deposit: Int as coins;
    change: Int as coins;
    value: Int as coins;
}

contract TestContract {
    pay: PaymentData;

    init() {
        self.pay = PaymentData{
            fee: 1000,
            deposit: 2000,
            change: 3000,
            value: 4000,
        };
    }
}