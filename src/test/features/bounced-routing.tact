message Entry {
    amountToAdd: Int as uint32;
    toAddress: Address;
}

message First {
    amount: Int as uint32;
    myCoins: Int as coins;
    myBool3: Bool;
    anAddress: Address;
}

message Second {
    amount_bigger: Int as uint64;
    myBool: Bool;
    thisDoesNotFit: Int as uint256;
    myAddress: Address;
    myBool2: Bool;
    myStruct: MyStruct;
    myStruct2: MyStruct;
}

struct MyStruct {
    amount: Int;
}

contract SampleContract {
    a: Int;

    init() {
        self.a = 100;
    }

    receive() {
        // Deploy
    }

    receive(msg: Entry) {
        self.a = self.a - msg.amountToAdd;
        send(SendParameters{
            to: msg.toAddress,
            value: ton("1"), 
            mode: SendIgnoreErrors, 
            bounce: true, 
            body: First{amount: msg.amountToAdd, myCoins: 3, myBool3: false, anAddress: sender()}.toCell()
        });
    }
    
    receive(msg: Second) {
        // do something with the Second struct
    }

    receive("Increment") {
        // simple handler for a text message
    }

    bounced(msg: Slice) {
        dump("In generic bounce!");
    }
    
    bounced(msg: bounced<First>) {
        dump("In bounce!");
        // only the first 224 bits are populated into a partial First struct
        let y: Bool = msg.myBool3;
        self.a = self.a + msg.amount - 2;
    }

    // This will be supported in a future commit, and will throw if the string does not fit within a bounced message
    //bounced("Increment") {
    // }

    get fun amount(): Int {
        return self.a;
    }
}

contract SampleContract2 {
    init() {}

    receive() {
    }

    receive(msg: First) {
        dump("Bouncing!");
        throw(144);
    }
}