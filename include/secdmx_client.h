#ifndef DMX_CLIENTAPI_H
#define DMX_CLIENTAPI_H

#ifdef __cplusplus
extern "C" {
#endif

/**\brief Init Secure Demux client
 * \retval SECDMX_SUCCESS On Success
 * \return Error code.
 */
int SECDMX_Init(void);

/**\brief Deinit Secure Demux client
 * \retval SECDMX_SUCCESS On Success
 * \return Error code.
 */
int SECDMX_Deinit(void);

/**\brief Allocate DVR Buffer for specific frontend device
 * \param[in] sid The frontend device id
 * \param[in] size The allocate size
 * \param[out] addr The DVR buffer address
 * \retval SECDMX_SUCCESS On Success
 * \return Error code.
 */
int SECDMX_AllocateDVRBuffer(int sid, size_t size, size_t *addr);

/**\brief Free specific DVR buffer
 * \param[in] sid The front device id
 * \retval SECDMX_SUCCESS On Success
 * \return Error code.
 */
int SECDMX_FreeDVRBuffer(int sid);

/**\brief Add a output buffer for specific frontend device
 * \param[in] sid The frontend device id
 * \param[in] addr The output buffer address
 * \param[in] size The output buffer size
 * \param[out] handle The returned output buffer handle
 * \retval SECDMX_SUCCESS On Success
 * \return Error code.
 */
int SECDMX_AddOutputBuffer(int sid, size_t addr, size_t size, size_t *handle);

/**\brief Add DVR pids for specific output buffer
 * \param[in] handle The output buffer handle
 * \param[in] pids The recording pid array
 * \param[in] pid_num The pid number
 * \retval SECDMX_SUCCESS On Success
 * \return Error code.
 */
int SECDMX_AddDVRPids(size_t handle, uint16_t *pids, int pid_num);

/**\brief Remove specific output buffer
 * \param[in] sid The frontend device id
 * \param[in] buf_id The output buffer id
 * \retval SECDMX_SUCCESS On Success
 * \return Error code.
 */
int SECDMX_RemoveOutputBuffer(size_t handle);

/**\brief Get current data start address and data len of specific output buffer
 * \param[in] handle The output buffer handle
 * \param[out] start_addr The data start address
 * \param[out] len The data len
 * \retval SECDMX_SUCCESS On Success
 * \return Error code.
 */
int SECDMX_GetOutputBufferStatus(size_t handle, size_t *start_addr, size_t *len);

/**\brief Divide data of DVR buffer to multiple output buffers
 * \param[in] sid The frontend device id
 * \param[in] wp The writer pointer of hw demux
 * \retval SECDMX_SUCCESS On Success
 * \return Error code.
 */
int SECDMX_ProcessData(int sid, size_t wp);

#ifdef __cplusplus
}
#endif
#endif /* DMX_CLIENTAPI_H */
