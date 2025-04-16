/// Test 1: Valid usage for a contract with no parameters (implicit empty init)
contract Foo {
    // No parameters, so there is an implicit empty init()
}

contract Main {
    receive() {
         // Using initOf and codeOf on contract Foo
         let pkg = initOf Foo();  // should capture the StateInit of Foo
         let c = codeOf Foo;      // should capture the code cell of Foo
    }
}
