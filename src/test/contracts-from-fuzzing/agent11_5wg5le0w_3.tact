message UniverseCalls {}

contract Test {
    // Valid usage: underscore as discard parameter as per documentation 
    receive(_: UniverseCalls) {}
}