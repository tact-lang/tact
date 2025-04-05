contract OptionalUnwrapTest {
    receive() {
        let opt: Int? = null;
        let flag: Int = 0;
        try {
            let x = opt!!; // should throw because opt is null
        } catch (code) {
            flag = 1;
        }
        require(flag == 1, "optional unwrapping error: expected throw");
        cashback(sender());
    }
}
