message Shoko {
    amount: Int as uint32;
    thisDoesNotFit: Int as uint256;
}

message Koko {
    amount_bigger: Int as uint64;
    thisDoesNotFit: Int as uint256;
}

contract SampleContract {
    init() {
    }

    receive(msg: Shoko) {
        // do something with the Shoko struct
    }
    
    receive(msg: Koko) {
        // do something with the Koko struct
    }

    receive("Increment") {
        // simple handler for a text message
    }

    
    bounced(msg: Koko~) {
        // only the first 224 bits are populated into a partial Koko struct
    }
    
    bounced(msg: Shoko~) {
        // only the first 224 bits are populated into a partial Shoko struct
    }

}