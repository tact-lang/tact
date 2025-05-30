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

        message(MessageParameters {
            bounce: false,
            to: sender(),
            value: 0,
            body: ReportStaticData {
                queryId: msg.queryId,
                itemIndex: self.itemIndex,
                collectionAddress: self.collectionAddress,
            }.toCell(),
            mode: SendRemainingValue,
        });
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
        forceBasechain(msg.newOwner);

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
            message(MessageParameters {
                bounce: false,
                to: msg.newOwner,
                value: msg.forwardAmount,
                body: OwnershipAssigned {
                    queryId: msg.queryId,
                    newOwner: self.owner!!,
                    forwardPayload: msg.forwardPayload,
                }.toCell(),
                mode: SendPayFwdFeesSeparately,
            });
        }

        if (needResponse) {
            forceBasechain(msg.responseDestination!!);
            message(MessageParameters {
                bounce: false,
                to: msg.responseDestination!!,
                value: restAmount,
                body: ExcessOut {
                    queryId: msg.queryId,
                }.toCell(),
                mode: SendPayFwdFeesSeparately,
            });
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
