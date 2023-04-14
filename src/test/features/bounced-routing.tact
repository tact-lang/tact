message EntryFirst {
    amountToAdd: Int as uint32;
    toAddress: Address;
}

message EntrySecond {
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

message Large {
    address: Address;
    value: Int as coins;
}

message SmallBounce {
    amount: Int as uint32;
    myBool3: Bool;
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

    receive(msg: EntryFirst) {
        self.a = self.a - msg.amountToAdd;
        send(SendParameters{
            to: msg.toAddress,
            value: ton("1"), 
            mode: SendIgnoreErrors, 
            bounce: true, 
            body: First{amount: msg.amountToAdd, myCoins: 3, myBool3: false, anAddress: sender()}.toCell()
        });
    }
    
    receive(msg: EntrySecond) {
        self.a = self.a - msg.amountToAdd;
        send(SendParameters{
            to: msg.toAddress,
            value: ton("1"), 
            mode: SendIgnoreErrors, 
            bounce: true, 
            body: Second{amount_bigger: msg.amountToAdd, myBool: false, thisDoesNotFit: 1, myAddress: sender(), myBool2: false, myStruct: MyStruct{amount: 1}, myStruct2: MyStruct{amount: 2}}.toCell()
        });
    }
    
    receive(msg: First) {
        // do something with the Second struct
        let x: First = msg;
    }

    receive(msg: Second) {
        // do something with the Second struct
    }

    receive("Increment") {
        // simple handler for a text message
    }

    bounced(msg: Slice) {
        dump("In generic bounce");
        let y: Int = msg.loadUint(32);
        self.a = 77;
    }
    
    bounced(msg: bounced<First>) {
        dump("In bounce of first");
        // only the first 224 bits are populated into a partial First struct
        let y: Bool = msg.myBool3;
        self.a = self.a + msg.amount - 2;
        // let z: Address = msg.anAddress; // This would throw
        let z: bounced<First> = msg;
    }
    
    bounced(msg: bounced<Second>) {
        dump("In bounce of second");
        self.a = self.a + msg.amount_bigger - 4;
    }

    bounced(msg: SmallBounce) {
        dump("In bounce of small bounce");
        self.a = self.a + msg.amount - 4;
    }

    bounced(msg: bounced<Large>) {
        dump("In bounce of large bounce");
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
        dump("Bouncing First!");
        throw(144);
    }
    
    receive(msg: Second) {
        dump("Bouncing Second!");
        throw(145);
    }
}