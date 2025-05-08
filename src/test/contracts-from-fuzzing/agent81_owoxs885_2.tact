message UniverseCalls {}

contract Example {
    // Valid usage: '_' as discard parameter in receiver function, per docs 
    receive(_: UniverseCalls) {
        // receiver body intentionally left empty
    }
}