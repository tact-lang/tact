const MOON_RADIUS_KM: Int = 1730 + (8 | 8); // expected: 1738

contract TestConstantEval() {
    receive() {
        require(MOON_RADIUS_KM == 1738, "Constant evaluation of MOON_RADIUS_KM failed");
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: "Const OK".asComment(),
        });
    }
}
