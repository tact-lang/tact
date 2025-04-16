contract Implicit {}

fun main() {
    // Test initOf on a contract with implicit empty init
    let pkg = initOf Implicit();
}
