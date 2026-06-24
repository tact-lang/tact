contract SelfTest {
    receive() {
        let a = myCode();
        let b = codeOf SelfTest;
        let eq: Bool = a == b;
    }
}

fun main() {}
