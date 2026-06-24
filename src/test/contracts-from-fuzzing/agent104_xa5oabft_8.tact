message MyMsg {
    value: Int;
}

message OtherMsg {
    data: Int;
}

contract Test {
    // Typed message receiver with underscore parameter for MyMsg
    receive(_: MyMsg) {
        // Process MyMsg without using the parameter
    }
    
    // Typed message receiver for OtherMsg with named parameter
    receive(msg: OtherMsg) {
        // Process OtherMsg using 'msg'
    }
}
