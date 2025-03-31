import "./constants";
import "./messages-sbt";

inline fun sendMsg(bounce: Bool, toAddress: Address, amount: Int, op: Int, queryId: Int, payload: Builder, sendMode: Int) {
    let msgBody = beginCell().storeUint(op, 32).storeUint(queryId, 64);

    if (payload.bits() != 0) {
        msgBody.storeBuilder(payload);
    }

    message(MessageParameters {
        bounce: bounce,
        to: toAddress,
        value: amount,
        body: msgBody.endCell(),
        mode: sendMode,
    });
}

contract SBTItem {
    itemIndex: Int as uint64;
    collectionAddress: Address;

    // state init data don't have this parameters
    owner: Address? = null;
    content: Cell? = null;
    authorityAddress: Address? = null;
    revokedAt: Int = 0;

    init(initNFTData: InitNFTData) {
        self.itemIndex = initNFTData.itemIndex;
        self.collectionAddress = initNFTData.collectionAddress;
    }

    receive() {} //to ignore empty messages 

    receive(msg: Slice) {
        // Check if owner == null, which means the contract hasn't been initialized yet
        // owner is used as an initialization flag: if null - contract is not initialized,
        // if not null - contract has been initialized before
        // This prevents contract re-initialization since initialization should happen only once
        // We use similar checks in other methods (e.g., Transfer, GetStaticData) with throwUnless(NotInit, self.owner != null)
        // to ensure the contract is properly initialized before executing any operations
        throwUnless(InvalidData, self.owner == null);
        throwUnless(IncorrectDeployer, sender() == self.collectionAddress);

        let owner: Address = msg.loadAddress();
        self.owner = owner;

        let content: Cell = msg.loadRef();
        self.content = content;

        let authorityAddress: Address = msg.loadAddress();
        self.authorityAddress = authorityAddress;

        let revokedAt: Int = msg.loadUint(64);
        self.revokedAt = revokedAt;
    }

    receive(msg: RequestOwner) {
        throwUnless(NotInit, self.owner != null);

        let content: Cell? = self.content!!;

        if (!msg.withContent) {
            content = null;
        }

        let msgBody = RequestOwnerOut {
            queryId: msg.queryId,
            index: self.itemIndex,
            senderAddress: sender(),
            ownerAddress: self.owner!!,
            body: msg.body,
            revokedAt: self.revokedAt,
            content: content,
        };

        message(MessageParameters {
            to: msg.destination,
            value: 0,
            mode: SendRemainingValue,
            bounce: true,
            body: msgBody.toCell(),
        });
    }

    receive(msg: ProveOwnership) {
        throwUnless(NotInit, null != self.owner);
        throwUnless(IncorrectSender, self.owner == sender());

        let content: Cell? = self.content!!;

        if (!msg.withContent) {
            content = emptyCell();
        }

        let msgBody = ProveOwnershipOut {
            queryId: msg.queryId,
            index: self.itemIndex,
            ownerAddress: self.owner!!,
            body: msg.body,
            revokedAt: self.revokedAt,
            content: content,
        };

        message(MessageParameters {
            to: msg.destination,
            value: 0,
            mode: SendRemainingValue,
            bounce: true,
            body: msgBody.toCell(),
        });
    }

    receive(msg: GetStaticData) {
        throwUnless(NotInit, self.owner != null);

        let msgBody = ReportStaticData {
            queryId: msg.queryId,
        };

        message(MessageParameters {
            bounce: false,
            to: sender(),
            value: 0,
            body: msgBody.toCell(),
            mode: SendRemainingValue,
        });
    }

    receive(msg: TakeExcess) {
        throwUnless(NotInit, self.owner != null);
        throwUnless(IncorrectSender, self.owner == sender());

        nativeReserve(minTonsForStorage, ReserveExact);

        let msgBody = ExcessOut { queryId: msg.queryId };

        message(MessageParameters {
            bounce: false,
            to: sender(),
            value: 0,
            body: msgBody.toCell(),
            mode: SendRemainingBalance,
        });
    }

    receive(msg: Destroy) { 
        throwUnless(NotInit, self.owner != null);
        throwUnless(IncorrectSender, self.owner == sender());

        let msgBody = ExcessOut { queryId: msg.queryId };

        message(MessageParameters {
            bounce: false,
            to: sender(),
            value: 0,
            body: msgBody.toCell(),
            mode: SendRemainingBalance,
        });

        self.owner = null;
        self.authorityAddress = null;
    }

    receive(msg: Revoke) { 
        throwUnless(NotInit, self.owner != null);
        throwUnless(IncorrectSender, self.authorityAddress == sender());
        throwUnless(AlreadyRevoked, self.revokedAt == 0);

        self.revokedAt = now();
    }

    receive(msg: Transfer) {
        throwUnless(NotInit, self.owner != null);
        throw(InvalidMethod);
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

    get fun get_authority_address(): Address? {
        return self.authorityAddress;
    }

    get fun get_revoked_time(): Int {
        return self.revokedAt;
    }
}
