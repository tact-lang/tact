import type { Address, Cell } from "@ton/core";
import { beginCell, SendMode } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";

const Opcodes = {
    action_send_msg: 0x0ec3c86d,
    action_set_code: 0xad4de08e,
    action_extended_set_data: 0x1ff8ea0b,
    action_extended_add_extension: 0x02,
    action_extended_remove_extension: 0x03,
    action_extended_set_signature_auth_allowed: 0x04,
    auth_extension: 0x6578746e,
    auth_signed: 0x7369676e,
    auth_signed_internal: 0x73696e74,
};

export async function sendInternalMessageFromExtension(
    via: SandboxContract<TreasuryContract>,
    to: Address,
    opts: {
        value: bigint;
        body: Cell;
    },
) {
    return await via.send({
        to,
        value: opts.value,
        body: beginCell()
            .storeUint(Opcodes.auth_extension, 32)
            .storeUint(0, 64)
            .storeSlice(opts.body.asSlice())
            .endCell(),
    });
}

export function createSendTxActionMsg(
    testReceiver: Address,
    forwardValue: bigint,
) {
    const sendTxMsg = beginCell()
        .storeUint(0x10, 6)
        .storeAddress(testReceiver)
        .storeCoins(forwardValue)
        .storeUint(0, 1 + 4 + 4 + 64 + 32 + 1 + 1)
        .storeRef(beginCell().endCell())
        .endCell();

    const sendTxActionAction = beginCell()
        .storeUint(0x0ec3c86d, 32)
        .storeInt(SendMode.PAY_GAS_SEPARATELY | SendMode.IGNORE_ERRORS, 8)
        .storeRef(sendTxMsg)
        .endCell();

    const actionsList = beginCell()
        .storeMaybeRef(
            beginCell()
                .storeRef(beginCell().endCell()) // empty child - end of action list
                .storeSlice(sendTxActionAction.beginParse())
                .endCell(),
        )
        .storeBit(false) // no other_actions
        .endCell();

    return actionsList;
}

export function createAddExtActionMsg(testExtension: Address) {
    const addExtensionAction = beginCell()
        .storeUint(Opcodes.action_extended_add_extension, 8)
        .storeAddress(testExtension)
        .endCell();

    const actionsList = beginCell()
        .storeMaybeRef(null) // no c5 out actions
        .storeBit(true) // have other actions
        .storeSlice(addExtensionAction.beginParse())
        .endCell();

    return actionsList;
}
