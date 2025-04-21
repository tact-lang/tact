import "./constants";
import "./messages-nft";
import "./nft-item";

struct DictGet {
    itemIndex: Int? as uint64; // IndexSizeBits = 64
    item: Slice?;
    flag: Int;
}

// (int, slice, int) udict_get_min?(cell dict, int key_len) asm (-> 1 0 2) "DICTUMIN" "NULLSWAPIFNOT2";
asm(-> 1 0 2) fun dictGetMin(dict: Cell, keySize: Int): DictGet { DICTUMIN NULLSWAPIFNOT2 }

// (int, slice, int) udict_get_next?(cell dict, int key_len, int pivot) asm(pivot dict key_len -> 1 0 2) "DICTUGETNEXT" "NULLSWAPIFNOT2";
asm(-> 1 0 2) fun dictGetNext(pivot: Int, dict: Cell, keySize: Int): DictGet { DICTUGETNEXT NULLSWAPIFNOT2 }

contract NFTCollection {
    owner: Address;
    nextItemIndex: Int as uint64; // IndexSizeBits = 64
    content: Cell;
    royaltyParams: RoyaltyParams;

    commonCode: Cell;
    commonData: Builder;

    init(owner: Address, nextItemIndex: Int, collectionContent: Cell, royaltyParams: RoyaltyParams) {
        self.owner = owner;
        self.nextItemIndex = nextItemIndex;
        self.content = collectionContent;
        self.royaltyParams = royaltyParams;

        self.commonCode = codeOf NFTItem;
        self.commonData = beginCell()
            .storeUint(0, 3) // 0b00 - null address and 0b0 - null content cell
            .storeAddress(myAddress());
    }

    receive() {} // ignore empty messages

    receive(msg: GetRoyaltyParams) {
        message(MessageParameters {
            bounce: false,
            to: sender(),
            value: 0,
            body: ReportRoyaltyParams {
                queryId: msg.queryId,
                params: self.royaltyParams,
            }.toCell(),
            mode: SendRemainingValue,
        });
    }

    receive(msg: DeployNFT) {
        throwUnless(IncorrectSender, sender() == self.owner);
        throwUnless(IncorrectIndex, msg.itemIndex <= self.nextItemIndex);

        deployNFTItem(self.commonCode, msg.itemIndex, msg.amount, msg.initNFTBody, self.commonData);

        if (msg.itemIndex == self.nextItemIndex) {
            self.nextItemIndex += 1;
        }
    }

    receive(msg: BatchDeploy) {
        throwUnless(IncorrectSender, sender() == self.owner);

        let currNFTItem: DictGet = dictGetMin(msg.deployList, IndexSizeBits);
        let counter: Int = 0;

        while (currNFTItem.flag != 0) {
            counter += 1;
            // we can check outside the loop, but for benchmark place it here
            throwIf(IncorrectAmount, counter >= 250); // implementation detail

            throwUnless(IncorrectIndexes + counter, currNFTItem.itemIndex!! <= self.nextItemIndex);

            deployNFTItem(self.commonCode, currNFTItem.itemIndex!!, currNFTItem.item!!.loadCoins(), currNFTItem.item!!.loadRef(), self.commonData);
            if (currNFTItem.itemIndex!! == self.nextItemIndex) {
                self.nextItemIndex += 1;
            }

            currNFTItem = dictGetNext(currNFTItem.itemIndex!!, msg.deployList, IndexSizeBits);
        }
    }

    receive(msg: ChangeOwner) {
        throwUnless(IncorrectSender, sender() == self.owner);
        self.owner = msg.newOwner;
    }

    get fun get_collection_data(): CollectionData {
        let cs: Slice = self.content.beginParse();
        return CollectionData {
            nextItemIndex: self.nextItemIndex,
            collectionContent: cs.loadRef(),
            owner: self.owner,
        };
    }

    get fun get_nft_address_by_index(index: Int): Address {
        let stateInit = initOf NFTItem(null, null, myAddress(), index);
        return contractAddress(stateInit);
    }

    get fun royalty_params(): RoyaltyParams {
        return self.royaltyParams;
    }

    get fun get_nft_content(index: Int, individualNFTContent: Cell): Cell {
        let cs = self.content.beginParse();
        cs.skipRef();
        let commonContent = cs.loadRef().beginParse();
        return beginCell()
            .storeUint(1, 8) // off-chain tag
            .storeSlice(commonContent)
            .storeRef(individualNFTContent)
            .endCell();
    }
}

inline fun deployNFTItem(commonCode: Cell, itemIndex: Int, amount: Int, initNFTBody: Cell, commonData: Builder) {
    let data: Cell = commonData.storeUint(itemIndex, 64).endCell(); // IndexSizeBits = 64

    deploy(DeployParameters {
        value: amount,
        body: initNFTBody,
        init: StateInit { code: commonCode, data: data },
        mode: SendPayFwdFeesSeparately,
    });
}
