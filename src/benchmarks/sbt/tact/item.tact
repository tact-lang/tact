import "./constants";
import "./messages";

struct SBTItemInit {
    owner: Address;
    content: Cell;
    authorityAddress: Address;
    revokedAt: Int as uint64;
}

contract SBTItem(
    itemIndex: Int as uint64,
    collectionAddress: Address,
    owner: Address?,
    content: Cell?,
    authorityAddress: Address?,
    revokedAt: Int as uint64,
) {
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

        let itemInit = SBTItemInit.fromSlice(msg);
        self.owner = itemInit.owner;
        self.content = itemInit.content;
        self.authorityAddress = itemInit.authorityAddress;
        self.revokedAt = itemInit.revokedAt;
    }

    receive(msg: RequestOwner) {
        throwUnless(NotInit, self.owner != null);

        let content: Cell? = msg.withContent ? self.content!! : null;

        let msgBody = RequestOwnerOut {
            queryId: msg.queryId,
            index: self.itemIndex,
            senderAddress: sender(),
            ownerAddress: self.owner!!,
            body: msg.body,
            revokedAt: self.revokedAt,
            content,
        };

        MessageParameters {
            to: msg.destination,
            value: 0,
            mode: SendRemainingValue,
            bounce: true,
            body: msgBody.toCell(),
        }.send();
    }

    receive(msg: ProveOwnership) {
        throwUnless(NotInit, null != self.owner);
        throwUnless(IncorrectSender, self.owner == sender());

        let content: Cell? = msg.withContent ? self.content!! : null;

        let msgBody = ProveOwnershipOut {
            queryId: msg.queryId,
            index: self.itemIndex,
            ownerAddress: self.owner!!,
            body: msg.body,
            revokedAt: self.revokedAt,
            content,
        };

        MessageParameters {
            to: msg.destination,
            value: 0,
            mode: SendRemainingValue,
            bounce: true,
            body: msgBody.toCell(),
        }.send();
    }

    bounced(msg: bounced<ProveOwnershipOut>) {
        MessageParameters {
            to: self.owner!!,
            value: 0,
            mode: SendRemainingValue,
            bounce: false,
            body: ProveOwnershipBounced {
                queryId: msg.queryId,
            }.toCell(),
        }.send();
    }

    receive(msg: GetStaticData) {
        throwUnless(NotInit, self.owner != null);

        let msgBody = ReportStaticData {
            queryId: msg.queryId,
            index: self.itemIndex,
            collectionAddress: self.collectionAddress,
        };

        MessageParameters {
            bounce: false,
            to: sender(),
            value: 0,
            body: msgBody.toCell(),
            mode: SendRemainingValue,
        }.send();
    }

    receive(msg: TakeExcess) {
        throwUnless(NotInit, self.owner != null);
        throwUnless(IncorrectSender, self.owner == sender());

        nativeReserve(minTonsForStorage, ReserveExact);

        let msgBody = ExcessOut { queryId: msg.queryId };

        MessageParameters {
            bounce: false,
            to: sender(),
            value: 0,
            body: msgBody.toCell(),
            mode: SendRemainingBalance,
        }.send();
    }

    receive(msg: Destroy) {
        throwUnless(NotInit, self.owner != null);
        throwUnless(IncorrectSender, self.owner == sender());

        let msgBody = ExcessOut { queryId: msg.queryId };

        MessageParameters {
            bounce: false,
            to: sender(),
            value: 0,
            body: msgBody.toCell(),
            mode: SendRemainingBalance,
        }.send();

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
