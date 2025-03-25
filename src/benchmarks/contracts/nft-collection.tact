import "./constants";
import "./messages-nft";
import "./nft-item";

struct DictGet {
    itemIndex: Int? as uint64;
    item: Slice?;
    flag: Int;
}

// (int, slice, int) udict_get_min?(cell dict, int key_len) asm (-> 1 0 2) "DICTUMIN" "NULLSWAPIFNOT2";
asm(-> 1 0 2) fun dictGetMin(dict: Cell, keySize: Int): DictGet { DICTUMIN NULLSWAPIFNOT2 }

// (int, slice, int) udict_get_next?(cell dict, int key_len, int pivot) asm(pivot dict key_len -> 1 0 2) "DICTUGETNEXT" "NULLSWAPIFNOT2";
asm(-> 1 0 2) fun dictGetNext(pivot: Int, dict: Cell, keySize: Int): DictGet { DICTUGETNEXT NULLSWAPIFNOT2 }

contract NFTCollection with ExitCodes, GasConstants {
    owner: Address;
    nextItemIndex: Int as uint64;
    content: Cell;
    royaltyParams: RoyaltyParams;

    commonCode: Cell;
    commonData: Builder;

    init(owner: Address, nextItemIndex: Int, collectionContent: Cell, royaltyParams: RoyaltyParams) {
        self.owner         = owner;
        self.nextItemIndex = nextItemIndex;
        self.content       = collectionContent;
        self.royaltyParams = royaltyParams;

        self.commonCode    = (initOf NFTItem(myAddress(), 0)).code;
        self.commonData    = beginCell().storeUint(0, 1).storeAddress(myAddress());
    }
    
    inline fun deployNFTItem(itemIndex: Int, amount: Int, initNFTBody: Cell) {
        let data: Cell = self.commonData.storeInt(itemIndex, 257).endCell();

        deploy(DeployParameters{
            value: amount,
            body: initNFTBody,
            init: StateInit{code: self.commonCode, data: data},
            mode: SendPayGasSeparately 
        });
    }

    receive() {} // ignore empty messages
    
    receive(msg: GetRoyaltyParams) {
        message(MessageParameters{
            bounce: false,
            to: sender(),
            value: 0,
            body: ReportRoyaltyParams{
                      queryId: msg.queryId,
                      params:  self.royaltyParams,
                    }.toCell(),
            mode: SendRemainingValue 
        });
    }

    receive(msg: DeployNFT) {
        throwUnless(self.IncorrectSender, sender() == self.owner); 
        throwUnless(self.IncorrectIndex, msg.itemIndex <= self.nextItemIndex);

        self.deployNFTItem(msg.itemIndex, msg.amount, msg.initNFTBody); 

        if(msg.itemIndex == self.nextItemIndex) {
            self.nextItemIndex += 1;
        }
    }

    receive(msg: BatchDeploy) {
        throwUnless(self.IncorrectSender, sender() == self.owner);

        let curr: DictGet = dictGetMin(msg.deployList, 64);
        let counter: Int  = 0;

        while (curr.flag != 0) {
            counter += 1;
            
            throwUnless(self.IncorrectIndexes + counter, curr.itemIndex!! <= self.nextItemIndex);

            self.deployNFTItem(curr.itemIndex!!, curr.item!!.loadCoins(), curr.item!!.loadRef());
            if (curr.itemIndex!! == self.nextItemIndex) {
                self.nextItemIndex += 1;
            }

            curr = dictGetNext(curr.itemIndex!!, msg.deployList, 64);
        }
				throwIf(self.IncorrectAmount, counter >= 250);
    }

    receive(msg: ChangeOwner)  {
        throwUnless(self.IncorrectSender, sender() == self.owner);
        self.owner = msg.newOwner;
    }
    
    get fun get_collection_data(): CollectionData {
        let cs: Slice = self.content.beginParse();
        return CollectionData{
            nextItemIndex: self.nextItemIndex,
            collectionContent: cs.loadRef(),
            owner: self.owner
        };
    }

    get fun get_nft_address_by_index(index: Int): Address {
        let stateInit = initOf NFTItem(myAddress(), index);
        return contractAddress(stateInit);
    }

    get fun royalty_params(): RoyaltyParams {
        return self.royaltyParams;
    }

    get fun get_nft_content(index: Int, individualNFTContent: Cell): Cell {
        let cs = self.content.beginParse();
        cs.loadRef();
        let commonContent = cs.loadRef().beginParse();
        return beginCell().storeUint(1, 8).storeSlice(commonContent).storeRef(individualNFTContent).endCell();
    }
}