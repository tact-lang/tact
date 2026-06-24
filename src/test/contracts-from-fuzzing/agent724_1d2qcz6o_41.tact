struct Payments {
    deposit: Int as coins;
    fee: Int as coins;
    reward: Int as coins;
}

contract TestContract {
    pay: Payments;

    init() {
        self.pay = Payments{
            deposit: 1000000,
            fee: 5000,
            reward: 20000
        };
    }
}