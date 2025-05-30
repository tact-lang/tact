import "./constants";
import "./messages";

struct NFTItemInit {
    owner: Address;
    content: Cell;
}

contract NFTItem(
    owner: Address?,
    content: Cell?,
    collectionAddress: Address,
    itemIndex: Int as uint64,
) {
    receive() {} // ignore empty messages

    receive(msg: GetStaticData) {
        throwUnless(NotInit, self.owner != null);

        sendMsg(
            sender(),
            0,
            ReportStaticData,
            msg.queryId,
            beginCell()
                .storeUint(self.itemIndex, 256)
                .storeAddress(self.collectionAddress),
            SendRemainingValue,
        ); // implementation detail
    }

    receive(msg: Slice) {
        // Check if owner == null, which means the contract hasn't been initialized yet
        // owner is used as an initialization flag: if null - contract is not initialized,
        // if not null - contract has been initialized before
        // This prevents contract re-initialization since initialization should happen only once
        // We use similar checks in other methods (e.g., Transfer, GetStaticData) with throwUnless(NotInit, self.owner != null)
        // to ensure the contract is properly initialized before executing any operations
        throwUnless(InvalidData, self.owner == null);
        throwUnless(IncorrectDeployer, sender() == self.collectionAddress);

        let nftItemInit = NFTItemInit.fromSlice(msg);

        self.owner = nftItemInit.owner;
        self.content = nftItemInit.content;
    }

    receive(msg: Transfer) {
        throwUnless(NotInit, self.owner != null);
        throwUnless(IncorrectSender, sender() == self.owner);
        throwUnless(IncorrectForwardPayload, msg.forwardPayload.bits() >= 1);
        forceBasechainFunc(msg.newOwner);

        let fwdFees = context().readForwardFee();

        let restAmount = myBalance() - minTonsForStorage;
        if (msg.forwardAmount > 0) {
            restAmount -= msg.forwardAmount + fwdFees;
        }

        // when we load addr_none$00 in tact we got null
        let needResponse = msg.responseDestination != null;
        if (needResponse) {
            restAmount -= fwdFees;
        }

        throwUnless(InvalidFees, restAmount >= 0);

        if (msg.forwardAmount > 0) {
            sendMsg(
                msg.newOwner,
                msg.forwardAmount,
                OwnershipAssigned,
                msg.queryId,
                beginCell()
                    .storeAddress(self.owner!!)
                    .storeSlice(msg.forwardPayload),
                SendPayFwdFeesSeparately,
            );
        }

        if (needResponse) {
            forceBasechainFunc(msg.responseDestination!!);
            sendMsg(
                msg.responseDestination!!,
                restAmount,
                Excesses,
                msg.queryId,
                beginCell(),
                SendPayFwdFeesSeparately,
            );
        }

        self.owner = msg.newOwner;
    }

    get fun get_nft_data(): NFTData {
        return NFTData {
            init: self.owner != null ? -1 : 0, // -1 is true
            itemIndex: self.itemIndex,
            collectionAddress: self.collectionAddress,
            owner: self.owner,
            content: self.content,
        };
    }
}

asm fun forceBasechainFunc(address: Address) { REWRITESTDADDR DROP 333 THROWIF }

inline fun sendMsg(toAddress: Address, amount: Int, op: Int, queryId: Int, payload: Builder, sendMode: Int) {
    message(MessageParameters {
        bounce: false,
        to: toAddress,
        value: amount,
        body: beginCell()
            .storeUint(op, 32)
            .storeUint(queryId, 64)
            .storeBuilder(payload)
            .endCell(),
        mode: sendMode,
    });
}
