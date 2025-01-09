primitive Int;
primitive Bool;

fun alwaysReachableReturn(b: Bool): Int {
    let x: Int = 0;
    try {
        let y: Int = 1;
        return 42;
    } catch (e) {
        let z: Int = 1;
        return 43;
    }
}
