message First {
    amount: Int as uint32;
    thisDoesNotFit: Int as uint256;
}

message Second {
    amount_bigger: Int as uint64;
    thisDoesNotFit: Int as uint256;
    myAddress: Address;
    myBool: Bool;
    myStruct: MyStruct;
    myStruct2: MyStruct;
}

struct MyStruct {
    amount: Int;
}

contract SampleContract {
    init() {
    }

    receive(msg: First) {
        // do something with the First struct
    }
    
    receive(msg: Second) {
        // do something with the Second struct
        //let x: Int =  msg.amount_bigger;
    }

    receive("Increment") {
        // simple handler for a text message
    }

    bounced(msg: Slice) {
        // the general handler
    }
    
    bounced(tst: First~) {
        // only the first 224 bits are populated into a partial Koko struct
        let x: Int = tst.amount_bigger;
        let y: Int = msg.thisDoesNotFit; // compiler should throw
    }
    
    bounced(msg: Second~) {
        // only the first 224 bits are populated into a partial Shoko struct
    }

    bounced("Increment") {

    }
    
   

}