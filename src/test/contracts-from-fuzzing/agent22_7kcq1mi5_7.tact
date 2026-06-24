struct SendMode {
    PAY_GAS_SEPARATELY: Int;
    IGNORE_ERRORS: Int;
    DESTROY_ACCOUNT: Int;
}

const PAY_GAS_SEPARATELY: Int = 0;
const IGNORE_ERRORS: Int = 1;
const DESTROY_ACCOUNT: Int = 2;

contract Test {
    receive() {
        send(SendParameters{
            to: address("0:0000000000000000000000000000000000000000000000000000000000000000"),
            value: 0,
            mode: PAY_GAS_SEPARATELY,
            body: null
        });
    }
}