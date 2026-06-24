fun doSomething(optS: String?): String? {
    return optS;
}

contract TestContract {
    receive() {
        // testing usage of optional string in a function
        let x = doSomething(null);
        let y = doSomething("some string");
    }
}
