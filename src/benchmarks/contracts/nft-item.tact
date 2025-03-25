import "./constants";
import "./messages-nft";


asm fun emptyAddress(): Address { b{00} PUSHSLICE }

contract NFTItem with ExitCodes, GasConstants, OpCodes {
    itemIndex: Int as uint64;
    collectionAddress: Address;

    // state init data don't have this parameters
    owner: Address? = null;
    content: Cell?  = null;

    init(collectionAddress: Address, itemIndex: Int) {
        self.itemIndex         = itemIndex;
        self.collectionAddress = collectionAddress;
    }

    inline fun forceChain(address: Address) {
        throwUnless(self.InvalidDestinationWorkchain, parseStdAddress(address.asSlice()).workchain == 0);
    }

    inline fun sendMsg(toAddress: Address, amount: Int, op: Int, queryId: Int, payload: Builder, sendMode: Int) {
        let msgBody = beginCell().storeUint(op, 32).storeUint(queryId, 64);
        
        if (payload.bits() != 0 || payload.refs() != 0) {
            msgBody.storeBuilder(payload);
        }
        
        message(MessageParameters{
            bounce: false,
            to: toAddress,
            value: amount,
            body: msgBody.endCell(),
            mode: sendMode 
        });
    }
    
    receive() {} //to ignore empty messages 

    // we need it to accept deploy body from NFTCollection
    receive(msg: Slice){
        // we need this message only in init, if (self.owner != null) ==> we are already init
        throwUnless(self.InvalidData, self.owner == null);

        let owner: Address = msg.loadAddress();
        let content: Cell  = msg.loadRef();    

        throwUnless(self.IncorrectDeployer, sender() == self.collectionAddress);
        self.owner   = owner;
        self.content = content;
    }

    receive(msg: Transfer) {
        // not init 
        throwUnless(self.NotInit, self.owner != null);
        throwUnless(self.IncorrectSender, sender() == self.owner);
        throwUnless(self.IncorrectForwardPayload, msg.forwardPayload.bits() >= 1);
        self.forceChain(msg.newOwner);

        let fwdFees: Int = context().readForwardFee();


        let restAmount: Int = myBalance() - self.minTonsForStorage;
        if (msg.forwardAmount > 0) {
            restAmount -= (msg.forwardAmount + fwdFees);
        }

        // when we load addr_none$00 in tact we got null 
        let needResponse: Bool = (msg.responseDestination != null);
        if (needResponse) {
            restAmount -= fwdFees;
        }

        throwUnless(self.InvalidFees, restAmount >= 0);

        if(msg.forwardAmount > 0){
            self.sendMsg(msg.newOwner, msg.forwardAmount, self.OwnershipAssigned, msg.queryId, beginCell().storeAddress(self.owner!!).storeSlice(msg.forwardPayload), SendPayGasSeparately);
        }
        if(needResponse) { 
            self.forceChain(msg.responseDestination!!);
            self.sendMsg(msg.responseDestination!!, restAmount, self.Excesses, msg.queryId, beginCell(), SendPayGasSeparately);
        }
        self.owner = msg.newOwner;
    }

    receive(msg: GetStaticData) {
        // uninit
        throwUnless(self.NotInit, self.owner != null);

        self.sendMsg(sender(), 0, self.ReportStaticData, msg.queryId, beginCell().storeUint(self.itemIndex, 256).storeAddress(self.collectionAddress), SendRemainingValue);
    }
   
    get fun get_nft_data(): NFTData {
        return NFTData{
            init: self.owner != null ? -1 : 0, // -1 is true
            itemIndex: self.itemIndex,
            collectionAddress: self.collectionAddress,
            owner: self.owner,
            content: self.content
        };
    }
}

